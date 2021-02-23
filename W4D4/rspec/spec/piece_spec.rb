require 'piece.rb'

describe Piece do
    describe '#initialize' do
        context 'with valid arguments' do
            it 'initializes a piece correctly' do
                piece = Piece.new(:white, [0,0])
                expect(piece.color).to be(:white)
                expect(piece.pos).to eq([0, 0])
            end
        end

        context 'with invalid arguments' do
            it 'raises an error when given an invalid color' do
                expect { Piece.new(:blue, [0, 0]) }.to raise_error("Invalid color")
            end
            it 'raises an error when given an invalid position' do
                expect { Piece.new(:white, [9, 9]) }.to raise_error("Invalid pos")
            end
        end
    end

    describe '#pos=' do
        it 'correctly reassigns a piece\'s position' do
            piece = Piece.new(:white, [0,0])
            piece.pos = [1, 1]
            expect(piece.pos).to eq([1, 1])
        end
    end

    describe '#symbol' do
        it 'raises an error' do
            piece = Piece.new(:white, [0,0])
            expect{ piece.symbol }.to raise_error(NotImplementedError)
        end
    end

    describe '#empty?' do
        it 'returns false' do
            piece = Piece.new(:white, [0,0])
            expect(piece.empty?).to be false
        end
    end
end