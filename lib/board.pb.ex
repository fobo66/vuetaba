defmodule Vuetaba.Board do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          name: String.t(),
          tag: String.t(),
          timestamp: non_neg_integer
        }
  defstruct [:id, :name, :tag, :timestamp]

  field(:id, 1, type: :int64)
  field(:name, 2, type: :string)
  field(:tag, 3, type: :string)
  field(:timestamp, 4, type: :uint64)
end

defmodule Vuetaba.BoardRequest do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer
        }
  defstruct [:id]

  field(:id, 1, type: :int64)
end

defmodule Vuetaba.BoardListResponse do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          boardId: [integer]
        }
  defstruct [:boardId]

  field(:boardId, 1, repeated: true, type: :int64)
end

defmodule Vuetaba.PageRequest do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          page: integer,
          timestamp: integer
        }
  defstruct [:page, :timestamp]

  field(:page, 1, type: :int64)
  field(:timestamp, 2, type: :int64)
end
