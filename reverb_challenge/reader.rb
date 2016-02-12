module Reader
	require 'csv'

	def self.read
		output = []
		CSV.foreach(DATA_PATH) do |row|
			output << format_data(parse_row(row))
		end
		output
	end

	def self.format_data(data)
		{
			lastname: data[0],
			firstname: data[1],
			gender: data[2],
			favorite_color: data[3],
			birthdate: data[4]
		}
	end

	def self.parse_row(row)
		row = (row.length > 1 ? row.join(',') : row[0])
		if row.include?('|')
			data = row.split(' | ')
		elsif row.include?(',')
			data = row.split(', ')
		else
			data = row.split(' ')
		end
		return data
	end
end