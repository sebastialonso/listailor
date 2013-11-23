module ApplicationHelper
  #Helper para crear links que tengan iconos
  def icon_link_to(path, text, opts = {}, link_opts = {})
    classes = []
    [:icon, :blank].each do |klass|
      if k = opts.delete(klass)
        classes << "#{klass}-#{k}"
      end
    end
    classes << "enlarge" if opts.delete(:enlarge)
    opts[:class] ||= ""
    opts[:class] << " " << classes.join(" ")
    link_to content_tag(:i, "  #{text}", opts), path, link_opts
  end
end
