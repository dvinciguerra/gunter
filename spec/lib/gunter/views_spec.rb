# frozen_string_literal: true

require 'json'
require 'gunter/views'

RSpec.describe Gunter::Views do
  let(:data) { build(:template).then { |template| { template[:name] => template } } }

  describe '.render' do
    it 'renders the template' do
      on_spying_output -> { Gunter::Views.render(:json, :templates, data) },
                       assert: ->(output) { expect(output).to eq("#{data.to_json}\n") }
    end

    context 'when the template does not exist' do
      it 'raises an error' do
        expect { Gunter::Views.render(:json, :foo, data) }
          .to raise_error(Gunter::TemplateError)
      end
    end
  end
end
