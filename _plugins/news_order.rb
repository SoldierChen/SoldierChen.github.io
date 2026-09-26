module NewsOrder
  def news_display_order(documents)
    ordered = documents.sort_by(&:date).reverse

    documents.each do |document|
      target_name = document.data['display_after']
      next unless target_name

      target = ordered.find { |item| File.basename(item.path, '.md') == target_name }
      next unless target && target != document

      ordered.delete(document)
      ordered.insert(ordered.index(target) + 1, document)
    end

    ordered
  end
end

Liquid::Template.register_filter(NewsOrder)
