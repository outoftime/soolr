module Soolr
  class Dismax
    FieldWithBoost = Struct.new(:field, :boost, :phrase_boost)

    attr_writer :minimum_match, :phrase_slop, :query_phrase_slop, :tie_breaker

    def initialize(keywords)
      @keywords, @fields = keywords, []
    end

    def add_field(field, options = {})
      @fields << FieldWithBoost.new(field, options[:boost], options[:phrase_boost])
    end

    def to_params
      fields = []
      phrase_fields = []
      @fields.each do |field_with_boost|
        fields <<
          if field_with_boost.boost
            "#{field_with_boost.field.name}^#{field_with_boost.boost}"
          else
            field_with_boost.field.name
          end
        if field_with_boost.phrase_boost
          phrase_fields << "#{field_with_boost.field.name}^#{field_with_boost.phrase_boost}"
        end
      end

      params = {
        :q => @keywords,
        :qt => 'dismax',
        :qf => fields.join(' ')
      }
      params[:mm] = @minimum_match if @minimum_match
      params[:pf] = phrase_fields.join(' ') unless phrase_fields.empty?
      params[:ps] = @phrase_slop if @phrase_slop
      params[:qs] = @query_phrase_slop if @query_phrase_slop
      params[:tie] = @tie_breaker if @tie_breaker
      params
    end
  end
end
