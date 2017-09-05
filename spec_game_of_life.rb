#spec file

require 'rspec'
require_relative 'game_of_life.rb'

describe 'Game of life' do

  let!(:world) { World.new }

#Test for World Class
  context 'world' do
    subject { World.new }

    it 'should create a new world object' do
      expect(subject.is_a?(World)).to be true
    end

    it 'should respond to proper methods' do
      expect(subject).to respond_to(:rows)
      expect(subject).to respond_to(:cols)
      expect(subject).to respond_to(:cell_grid)
      expect(subject).to respond_to(:neighbours_around_cell)
    end

    it 'should create proper cell grid on initialization' do
      expect(subject.cell_grid.is_a?(Array)).to be true

      subject.cell_grid.each do |row|
        expect(row.is_a?(Array)).to be true
        row.each do |col|
          expect(col.is_a?(Cell)).to be true
        end
      end
    end

  end

#Test for Cell Class
  context 'cell' do
    subject { Cell.new }

    it 'should create a new cell object' do
      expect(subject.is_a?(Cell)).to be true
    end

    it 'should respond to proper methods' do
      expect(subject).to respond_to(:alive)
      expect(subject).to respond_to(:x)
      expect(subject).to respond_to(:y)
      expect(subject).to respond_to(:alive?)
    end

    it 'should intialize cell properly' do
      expect(subject.alive).to be false
      expect(subject.x).to equal(0)
      expect(subject.y).to equal(0)
    end

  end

  context 'Game' do
    subject {Game.new}

    it 'should create a new game object' do
      expect(subject.is_a?(Game)).to be true
    end

    it 'should respond to proper methods' do
      expect(subject).to respond_to(:world)
      expect(subject).to respond_to(:seeds)
    end

    it 'should initialize properly' do
      expect(subject.world.is_a?(World)).to be true
      expect(subject.seeds.is_a?(Array)).to be true
    end

    it 'should plant seeds properly' do
      game = Game.new(world, [[1,2],[0,2]])
      expect(world.cell_grid[1][2]).to be_alive
      expect(world.cell_grid[0][2]).to be_alive
    end

  end

  context 'Rules' do

    let!(:game) {Game.new}

    context 'Rule 1: Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.' do

      it 'should kill a live cell with 1 live neighbour' do
        game = Game.new(world, [[1,0],[2, 0]])
        game.tick!
        expect(world.cell_grid[1][0]).to be_dead
        expect(world.cell_grid[2][0]).to be_dead
      end
    end
  end

end
