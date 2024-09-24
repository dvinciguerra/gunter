# frozen_string_literal: true

require 'gunter/model/git'

RSpec.describe Gunter::Model::Git do
  subject(:git) { described_class }

  before do
    allow(Kernel).to receive(:system)
    allow(described_class).to receive(:system)
    allow(FileUtils).to receive(:rm_rf)
  end

  describe '.clone' do
    it { expect(git).to respond_to(:clone) }

    context 'when no location is provided' do
      it 'clones a git repository to the repository name' do
        git.clone('gunter/gunter')

        expect(described_class)
          .to have_received(:system)
          .with('git clone --depth 1 git@github.com:gunter/gunter.git .')
      end
    end
  end
end
