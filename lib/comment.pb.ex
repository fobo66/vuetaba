defmodule Vuetaba.Comment do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
    id:        non_neg_integer,
    parent:    non_neg_integer,
    timestamp: non_neg_integer,
    lasthit:   non_neg_integer,
    ip:        String.t,
    name:      String.t,
    email:     String.t,
    password:  String.t,
    comment:   String.t,
    image:     Vuetaba.Image.t,
    sage:      boolean
  }
  defstruct [:id, :parent, :timestamp, :lasthit, :ip, :name, :email, :password, :comment, :image, :sage]

  field :id, 1, type: :uint64
  field :parent, 2, type: :uint64
  field :timestamp, 3, type: :uint64
  field :lasthit, 4, type: :uint64
  field :ip, 5, type: :string
  field :name, 6, type: :string
  field :email, 7, type: :string
  field :password, 8, type: :string
  field :comment, 9, type: :string
  field :image, 10, type: Vuetaba.Image
  field :sage, 11, type: :bool
end

defmodule Vuetaba.Image do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
    url: String.t
  }
  defstruct [:url]

  field :url, 1, type: :string
end

defmodule Vuetaba.ThreadRequest do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
    rootCommentId: non_neg_integer,
    timestamp:     non_neg_integer
  }
  defstruct [:rootCommentId, :timestamp]

  field :rootCommentId, 1, type: :uint64
  field :timestamp, 2, type: :uint64
end
