# frozen_string_literal: true

require 'gunter'

RSpec.describe Gunter do
  it 'has a version number' do
    expect(Gunter.version).to match(/\d+\.\d+\.\d+/)
  end

  it 'has a root directory' do
    expect(Gunter.root_dir).to eq(Gunter::GUNTER_DIR)
  end

  it 'has a model' do
    expect(Gunter.model(:project)).not_to be nil
  end

  it 'has a render' do
    on_spying_output -> { Gunter.render(:text, :gunter_version, Gunter.version) },
                     assert: ->(output) { expect(output).to match(/gunter version: \d+\.\d+\.\d+/) }
  end
end
