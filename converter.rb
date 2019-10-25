require 'csv'

data_list = 'sample.csv'
file_path = 'index_db.csv'

csv_table = CSV.table(data_list, header_converters: lambda {|h| h == 'コード' ? '行番号' : h})
csv_table.map.with_index(1) {|row, i| row['行番号'] = i}
csv_table.delete('番地')

File.open(file_path, 'wb'){|f| f.puts(csv_table.to_csv)}

# これはテストだよ
