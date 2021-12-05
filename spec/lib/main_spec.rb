# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Main do
  subject { described_class.new('input.txt').call }

  let(:file_importer_double) { instance_double(FileImporter) }
  let(:processor_double) { instance_double(Processor) }
  let(:outputer_double) { instance_double(Outputer) }
  let(:data) { [1, 2, 3] }
  let(:processed_data) { [11, 12, 13] }
  let(:key) { 5 }

  before do
    stub_const('Main::KEY', key)
  end

  it 'outputs the scores', :aggregate_failures do
    expect(FileImporter).to receive(:new).and_return(file_importer_double)
    expect(file_importer_double).to receive(:call).and_return(data)

    expect(Processor).to receive(:new).with(data, key).and_return(processor_double)
    expect(processor_double).to receive(:call).and_return(processed_data)

    expect(Outputer).to receive(:new).with(processed_data).and_return(outputer_double)
    expect(outputer_double).to receive(:call)

    subject
  end
end
