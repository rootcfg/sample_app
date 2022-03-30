class OrderController < ApplicationController

  def pivot
    
    # Формирую временную таблицу из синтетики предварительно очистив
    my_table = Order.new.custom_sql
    my_table.each do |el|
      Order.create!(month: el["month"], count: el["count"], filename: el["filename"])
    end

    # Выбираю все записи из таблицы
    data = Order.all
    
    # Определяю как будет расположен pivot
    g = PivotTable::Grid.new do |g|
      g.source_data  = data
      g.column_name  = :month
      g.row_name     = :filename
      g.value_name   = :count
    end
    
    # Собираю его 
    g.build

    
    if my_table.present? 
      page = Axlsx::Package.new
      wb = page.workbook
      
      s = wb.styles
      bold_border = s.add_style border: {style: :medium, color: "000000", edges: [:top, :bottom, :left, :right]}, alignment: { horizontal: :center, vertical: :center, wrap_text: true }
      wrap_text = s.add_style(alignment: { horizontal: :center, vertical: :center, wrap_text: true }, 
                             b: true, 
                             border: {style: :medium, color: "000000", edges: [:top, :bottom, :left, :right]})
      
      page.workbook.add_worksheet(:name => "Отчет Костика 1") do |sheet|

        sheet.styles.add_style(alignment: { horizontal: :center, vertical: :center, wrap_text: true }, 
        b: true, 
        border: {style: :medium, color: "000000", edges: [:top, :bottom, :left, :right]})

        monthes = []
        monthes = monthes << "Filename"
        g.rows[0].orthogonal_headers.each do |month|
          monthes = monthes << month
        end
        sheet.add_row monthes, style: wrap_text
        sheet.sheet_pr.tab_color = 'FFFF6666'  

        row = []
        g.rows.each_with_index do |key, index|
          row << g.rows[index].header
          g.rows[index].data.each do |data|
            data.nil? ? row << "0" : row << data.count.to_s
          end
          sheet.add_row row, style: bold_border
          row = []
        end

        sheet.add_row ['A Simple Bar Chart']
          
        sheet.add_chart(Axlsx::Pie3DChart, start_at: 'A6', end_at: 'F20') do |chart|
          chart.add_series data: sheet['B2:M2'], labels: sheet['B1:M1'], title: sheet['A1']
        end
      end
    end
    
    page.use_shared_strings = true
    page.serialize(Rails.public_path + 'simple.xlsx')
    send_file Rails.public_path + 'simple.xlsx'
  end

end
