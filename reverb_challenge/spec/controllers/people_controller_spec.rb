require_relative '../../config.rb'

describe PeopleController do
  let(:controller) { PeopleController.new }

  describe '#by_gender' do
    it 'renders View with Person.by_gender' do
      Person.stub(:by_gender) { 'the right stuff' }
      controller.stub(:reset) { true }
      expect(View).to receive(:render).with('the right stuff')
      controller.by_gender
    end
  end

  describe '#by_birthdate' do
    it 'renders View with Person.by_birthdate' do
      Person.stub(:by_birthdate) { 'the right stuff' }
      controller.stub(:reset) { true }
      expect(View).to receive(:render).with('the right stuff')
      controller.by_birthdate
    end
  end

  describe '#by_lastname' do
    it 'renders View with Person.by_lastname' do
      Person.stub(:by_lastname) { 'the right stuff' }
      controller.stub(:reset) { true }
      expect(View).to receive(:render).with('the right stuff')
      controller.by_lastname
    end
  end

  describe '#reset' do
    it 'sets #command to nil' do
      controller.stub(:execute) { true }
      controller.command = 'not nil'
      expect(controller.command).to eq 'not nil'
      controller.reset
      expect(controller.command).to eq nil
    end

    it 'calls #execute' do
      execute = 'not called'
      controller.stub(:execute) { execute = 'called' }
      expect(execute).to eq 'not called'
      controller.reset
      expect(execute).to eq 'called'
    end
  end

  describe '#execute' do
    context '#command is nil' do
      it 'calls View#get_input' do
        get_input = 'not called'
        View.stub(:get_input) { get_input = 'called' }
        controller.stub(:by_called) { true }
        controller.command = nil
        expect(get_input).to eq 'not called'
        controller.execute
        expect(get_input).to eq 'called'
      end
    end

    context '#command is not nil' do
      it 'does not call View#get_input' do
        get_input = 'not called'
        View.stub(:get_input) { get_input = 'called' }
        controller.stub(:by_something) { true }
        controller.command = 'something'
        controller.execute
        expect(get_input).to eq 'not called'
      end

      it 'calls PeopleController#by_{command}' do
        controller.stub(:by_something) { true }
        controller.command = 'something'
        expect(controller).to receive(:by_something)
        controller.execute
      end
    end
  end
end