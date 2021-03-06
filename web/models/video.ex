defmodule Rumbl.Video do
  use Rumbl.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    belongs_to :user, Rumbl.User, type: :binary_id
    belongs_to :category, Rumbl.Category, type: :binary_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  @required_fields ~w(url title description)
  @optional_fields ~w(category_id)

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> assoc_constraint(:category)
  end

end
