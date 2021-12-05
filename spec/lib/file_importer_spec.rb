# frozen_string_literal: true

require 'spec_helper'

RSpec.describe FileImporter do
  subject { described_class.new(**params).call }

  context 'when no file is given' do
    let(:params) { {} }

    it 'loads the default file' do
      expect(subject).to eq [1, 2, 3, 4, 5, 6]
    end
  end

  context 'when a file is given' do
    let(:params) { { filename: 'input.txt' } }

    it 'loads the file' do
      expect(subject).to eq [1, 2, 3, 4, 5, 6]
    end
  end

  context 'when the file does not exist', :aggregate_failures do
    let(:params) { { filename: 'not_a_file' } }

    it 'exits gracefully with an error message' do
      expect { subject }.to output(/File not found in input_files directory/).to_stdout
      .and(raise_error(SystemExit))
    end
  end

  context 'when the filename is nil', :aggregate_failures do
    let(:params) { { filename: nil } }

    it 'exits gracefully with an error message' do
      expect { subject }.to output(/Filename cannot be nil/).to_stdout
      .and(raise_error(SystemExit))
    end
  end
end
