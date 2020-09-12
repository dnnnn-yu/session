# frozen_string_literal: true

module ApplicationHelper
  def display_items(keys_string, constant, type)
    return nil if keys_string.nil?
    items = []
    keys_string.split("").each do |key|
      items << constant[key]
    end
    render(partial: "/partials/#{type}", locals: {items: items})
  end

  def backward(path = "/")
    render(partial: "/partials/backward", locals: {path: path})
  end
end