class Order < ApplicationRecord

    def custom_sql
        Order.delete_all
       sql =  "with t as (select '445' ID, 12 METRICA_ROW_ID , 'month' ATTRIBUTE_NAME, '21-05-03' ATTRIBUTE_VALUE union all 
        select '446' ID, 12 METRICA_ROW_ID , 'count' ATTRIBUTE_NAME, '265' ATTRIBUTE_VALUE union all 
        select '447' ID, 12 METRICA_ROW_ID , 'filename' ATTRIBUTE_NAME, 'leadgen_organization_20210830_210001_0000.csv.zip' ATTRIBUTE_VALUE union all 
        select '448' ID, 13 METRICA_ROW_ID , 'month' ATTRIBUTE_NAME, '21-05-04' ATTRIBUTE_VALUE union all 
        select '449' ID, 13 METRICA_ROW_ID , 'count' ATTRIBUTE_NAME, '5698745' ATTRIBUTE_VALUE union all 
        select '450' ID, 13 METRICA_ROW_ID , 'filename' ATTRIBUTE_NAME, 'leadgen_organization_20210830_210001_0000.csv.zip' ATTRIBUTE_VALUE union all 
        select '451' ID, 24 METRICA_ROW_ID , 'month' ATTRIBUTE_NAME, '21-05-05' ATTRIBUTE_VALUE union all 
        select '452' ID, 24 METRICA_ROW_ID , 'count' ATTRIBUTE_NAME, '258963' ATTRIBUTE_VALUE union all 
        select '453' ID, 24 METRICA_ROW_ID , 'filename' ATTRIBUTE_NAME, 'leadgen_organization_20210830_210001_0000.csv.zip' ATTRIBUTE_VALUE union all 
        select '454' ID, 44 METRICA_ROW_ID , 'month' ATTRIBUTE_NAME, '21-05-06' ATTRIBUTE_VALUE union all 
        select '455' ID, 44 METRICA_ROW_ID , 'count' ATTRIBUTE_NAME, '456321' ATTRIBUTE_VALUE union all 
        select '456' ID, 44 METRICA_ROW_ID , 'filename' ATTRIBUTE_NAME, 'leadgen_organization_20210830_210001_0000.csv.zip' ATTRIBUTE_VALUE union all 
        select '457' ID, 64 METRICA_ROW_ID , 'month' ATTRIBUTE_NAME, '21-05-07' ATTRIBUTE_VALUE union all 
        select '458' ID, 64 METRICA_ROW_ID , 'count' ATTRIBUTE_NAME, '523654789' ATTRIBUTE_VALUE union all 
        select '459' ID, 64 METRICA_ROW_ID , 'filename' ATTRIBUTE_NAME, 'leadgen_organization_20210830_210001_0000.csv.zip' ATTRIBUTE_VALUE union all 
        select '460' ID, 84 METRICA_ROW_ID , 'month' ATTRIBUTE_NAME, '21-05-08' ATTRIBUTE_VALUE union all 
        select '461' ID, 84 METRICA_ROW_ID , 'count' ATTRIBUTE_NAME, '521589' ATTRIBUTE_VALUE union all 
        select '462' ID, 84 METRICA_ROW_ID , 'filename' ATTRIBUTE_NAME, 'leadgen_organization_20210830_210001_0000.csv.zip' ATTRIBUTE_VALUE union all 
        select '463' ID, 104 METRICA_ROW_ID , 'month' ATTRIBUTE_NAME, '21-05-09' ATTRIBUTE_VALUE union all 
        select '464' ID, 104 METRICA_ROW_ID , 'count' ATTRIBUTE_NAME, '52' ATTRIBUTE_VALUE union all 
        select '465' ID, 104 METRICA_ROW_ID , 'filename' ATTRIBUTE_NAME, 'leadgen_organization_20210830_210001_0000.csv.zip' ATTRIBUTE_VALUE union all 
        select '466' ID, 124 METRICA_ROW_ID , 'month' ATTRIBUTE_NAME, '21-05-10' ATTRIBUTE_VALUE union all 
        select '467' ID, 124 METRICA_ROW_ID , 'count' ATTRIBUTE_NAME, '0' ATTRIBUTE_VALUE union all 
        select '468' ID, 124 METRICA_ROW_ID , 'filename' ATTRIBUTE_NAME, 'leadgen_organization_20210830_210001_0000.csv.zip' ATTRIBUTE_VALUE union all 
        select '469' ID, 144 METRICA_ROW_ID , 'month' ATTRIBUTE_NAME, '21-05-11' ATTRIBUTE_VALUE union all 
        select '470' ID, 144 METRICA_ROW_ID , 'count' ATTRIBUTE_NAME, '547896' ATTRIBUTE_VALUE union all 
        select '471' ID, 144 METRICA_ROW_ID , 'filename' ATTRIBUTE_NAME, 'leadgen_organization_20210830_210001_0000.csv.zip' ATTRIBUTE_VALUE union all 
        select '472' ID, 164 METRICA_ROW_ID , 'month' ATTRIBUTE_NAME, '21-05-12' ATTRIBUTE_VALUE union all 
        select '473' ID, 164 METRICA_ROW_ID , 'count' ATTRIBUTE_NAME, '23658' ATTRIBUTE_VALUE union all 
        select '474' ID, 164 METRICA_ROW_ID , 'filename' ATTRIBUTE_NAME, 'leadgen_organization_20210830_210001_0000.csv.zip' ATTRIBUTE_VALUE union all 
        select '475' ID, 184 METRICA_ROW_ID , 'month' ATTRIBUTE_NAME, '21-05-13' ATTRIBUTE_VALUE union all 
        select '476' ID, 184 METRICA_ROW_ID , 'count' ATTRIBUTE_NAME, '753269' ATTRIBUTE_VALUE union all 
        select '477' ID, 184 METRICA_ROW_ID , 'filename' ATTRIBUTE_NAME, 'leadgen_organization_20210830_210001_0000.csv.zip' ATTRIBUTE_VALUE union all 
        select '478' ID, 204 METRICA_ROW_ID , 'month' ATTRIBUTE_NAME, '21-05-14' ATTRIBUTE_VALUE union all 
        select '479' ID, 204 METRICA_ROW_ID , 'count' ATTRIBUTE_NAME, '125489' ATTRIBUTE_VALUE union all 
        select '480' ID, 204 METRICA_ROW_ID , 'filename' ATTRIBUTE_NAME, 'leadgen_organization_20210830_210001_0001.csv.zip' ATTRIBUTE_VALUE) 
         
        select metrica_row_id, 
                 max(case when (ATTRIBUTE_NAME='month') then ATTRIBUTE_VALUE else NULL end) as month, 
                 max(case when (ATTRIBUTE_NAME='count') then ATTRIBUTE_VALUE else NULL end) as count, 
                 max(case when (ATTRIBUTE_NAME='filename') then ATTRIBUTE_VALUE else NULL end) as filename 
                 from t 
                 group by metrica_row_id 
                 order by metrica_row_id"

        @records = ActiveRecord::Base.connection.execute(sql)        
    end    
end
