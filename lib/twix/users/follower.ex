defmodule Twix.Users.Follower do
  use Ecto.Schema
  import Ecto.Changeset

  alias Twix.Users.User

  @require_params [:following_id, :follower_id]

  @primary_key false
  schema "followers" do
    belongs_to :follower, User
    belongs_to :following, User
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @require_params)
    |> validate_required(@require_params)
    |> unique_constraint([:following_id, :follower_id])
  end
end
