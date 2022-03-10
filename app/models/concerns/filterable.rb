# Modulo para filtrar por los scopes definidos en los modelos.
# Se debe definir cada scope con la estructura 'nombrecampo_filter'.
module Filterable
  extend ActiveSupport::Concern

  included do
    def filtrate(params)
      items = self.class.all

      items if params.blank?

      params.each { |key, value| items = items.send("#{key}_filter", value) }

      items
    end
  end
end
