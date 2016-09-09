defmodule Api.PostView do
  use Api.Web, :view

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, Api.PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, Api.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id,
      title: post.title,
      company: post.company,
      location: post.location,
      content: post.content,
      logo: post.logo,
      url: post.url}
  end
end
