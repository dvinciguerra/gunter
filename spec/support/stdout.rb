# frozen_string_literal: true

require 'stringio'

def on_spying_output(block, assert: ->(output) { expect(output).to be_empty })
  real_stdout = $stdout
  $stdout = StringIO.new

  block.call

  assert.call($stdout.string)
ensure
  $stdout = real_stdout
end

