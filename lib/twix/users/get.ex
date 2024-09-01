defmodule Twix.Users.Get do
  alias Twix.Repo
  alias Twix.Users.User

  def call(id) do
    case Repo.get(User, id) do
      nil ->
        {:error, :not_found}

      user ->
        {:ok, Repo.preload(user, followings: [:following], followers: [:follower])}
    end
  end
end
