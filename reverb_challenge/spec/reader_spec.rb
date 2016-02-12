require_relative '../config.rb'

describe Reader do
	let(:pipe_row) { ["Bartell | Carmela | male | yellow | 1996-06-06"] }
	let(:comma_row) { ["Bartell, Carmela, male, yellow, 1996-06-06"] }
	let(:space_row) { ["Bartell Carmela male yellow 1996-06-06"] }

	describe '#parse_row' do
		it 'converts rows into similar Array format' do
			expect(Reader.parse_row(comma_row)).to eq(Reader.parse_row(pipe_row))
			expect(Reader.parse_row(comma_row)).to eq(Reader.parse_row(space_row))
		end
	end

	describe '#read' do
		it 'returns an array of hashes from a CSV file' do
			expect(Reader.read).to be_a Array
			expect(Reader.read[0]).to be_a Hash
		end
	end

	describe '#format_data' do
		it 'converts a raw array of data to a hash with meaningful keys' do
			data = Reader.parse_row(pipe_row)
			expect(Reader.format_data(data)).to eq({lastname: data[0],
																							firstname: data[1],
																							gender: data[2],
																							favorite_color: data[3],
																							birthdate: data[4] })
		end
	end
end