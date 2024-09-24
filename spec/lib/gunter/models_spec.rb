# frozen_string_literal: true

require 'gunter/models'

RSpec.describe Gunter::Models do
  let(:model) { Gunter::Models.model(:project) }

  describe '.model' do
    it 'returns the model class' do
      expect(model).to eq(Gunter::Model::Project)
    end

    context 'when the model does not exist' do
      it 'raises an error' do
        expect { Gunter::Models.model(:foo) }
          .to raise_error(Gunter::ModelError, "Model 'foo' not found")
      end
    end
  end
end
