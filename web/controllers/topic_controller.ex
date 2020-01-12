defmodule Discuss.TopicController do
    use Discuss.Web, :controller
    
    alias Discuss.Topic

    def index(conn, _params) do
        topics = Repo.all(Topic)
        render conn, "index.html", topics: topics
    end

    def new(conn, _params) do
        changeset = Topic.changeset(%Discuss.Topic{}, %{})

        #render conn, "new.html", changeset: changeset
        render_new conn, changeset
    end

    def render_new(conn, changeset) do
        render conn, "new.html", changeset: changeset
    end


    def create(conn, %{"topic" => topic}) do
        changeset = Topic.changeset(%Topic{}, topic)
        
        case Repo.insert(changeset) do  
            {:ok, post} -> IO.inspect(post)
            {:error, changeset} -> 
                #render conn, "new.html", changeset: changeset
                render_new conn, changeset
        end
    end
end