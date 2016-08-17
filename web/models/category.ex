defmodule Rumbl.Category do
  use Rumbl.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "categories" do
    field :name, :string
    has_many :videos, Rumbl.Video

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
