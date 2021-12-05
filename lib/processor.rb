# frozen_string_literal: true

class Processor
  def initialize(data, key)
    @data = data
    @key = key

    raise 'No data provided' unless data&.any?
    raise 'Key cannot be nil' unless key
  end

  def call
    process_data
  end

  private

  attr_reader :data, :key

  def process_data
    data.map { |item| process_item(item) }
  end

  def process_item(item)
    key - item
  end
end
