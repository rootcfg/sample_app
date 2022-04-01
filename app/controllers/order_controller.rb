class OrderController < ApplicationController


  def pivot

    # Формирую временную таблицу из синтетики предварительно очистив
    my_table = Order.new.custom_sql
    my_table.each do |el|
      Order.create!(month: el["month"], count: el["count"], filename: el["filename"])
    end

    g = pivot_table(Order.all,:month, :filename, :count)
    
    if my_table.present? 
      page = Axlsx::Package.new
      wb = page.workbook
      
      s = wb.styles

      
      page.workbook.add_worksheet(:name => "TG1") do |sheet|

        @bold_border = s.add_style border: {style: :medium, color: "000000", edges: [:top, :bottom, :left, :right]}, alignment: { horizontal: :center, vertical: :center, wrap_text: true }
        @wrap_text = s.add_style(alignment: { horizontal: :center, vertical: :center, wrap_text: true }, 
                               b: true, 
                               border: {style: :medium, color: "000000", edges: [:top, :bottom, :left, :right]})
        @left_alignment =  s.add_style(alignment: {horizontal: :left}, vertical: :center)
        @right_alignment = s.add_style(alignment: {horizontal: :right}, vertical: :center)
            
        monthes = []
        monthes = monthes << " "
        g.rows[0].orthogonal_headers.each do |month|
          monthes = monthes << month
        end
        sheet.add_row monthes, style: @wrap_text
        sheet.sheet_pr.tab_color = 'FFF0F8FF'  

        row = []
        g.rows.each_with_index do |key, index|
          row << g.rows[index].header
          g.rows[index].data.each do |data|
            data.nil? ? row << "0" : row << data.count.to_s
          end
          sheet.add_row row
          row = []
        end

      end
    end

    page.workbook.add_worksheet(:name => "TGT7") do |sheet|
      
     g = pivot_table(Tgt7.all,:month, :region, :count)

      sheet.styles.add_style(alignment: { horizontal: :center, vertical: :center, wrap_text: true }, 
      b: true, 
      border: {style: :medium, color: "000000", edges: [:top, :bottom, :left, :right]})

      monthes = []
      monthes = monthes << " "
      g.rows[0].orthogonal_headers.each do |month|
        monthes = monthes << month
      end

      sheet.add_row monthes, style: @wrap_text
      sheet.sheet_pr.tab_color = 'FFFF1493'  

      amount = []
      amount = amount << "Итого:"
      
      g.columns.each do |column|
        summ = 0
        column.data.compact.each { |cell| summ = summ + cell.count.to_i }
        amount << summ
      end
      sheet.add_row amount, style: @right_alignment



      row = []
      g.rows.each_with_index do |key, index|
        row << (helpers.region_code(g.rows[index].header).nil? ? g.rows[index].header : helpers.region_code(g.rows[index].header))
        g.rows[index].data.each do |data|
          data.nil? ? row << "0" : row << data.count.to_s
        end
        sheet.add_row row
        row = []
      end

    end
    
    page.use_shared_strings = true
    page.serialize(Rails.public_path + 'simple.xlsx')
    send_file Rails.public_path + 'simple.xlsx'
  end


  private

  def pivot_table(data, column, row, value)

    m = PivotTable::Grid.new do |m|
      m.source_data  = data
      m.column_name  = column
      m.row_name     = row
      m.value_name   = value
    end

    m.build

  end

end
