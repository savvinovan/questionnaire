module TestsHelper

  def progress(data)
    (data.current_page.to_f / data.total_pages)*100
  end
end
