defmodule Vuetaba.SpamRequest do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
    commentId: integer,
    reason:    String.t,
    email:     String.t
  }
  defstruct [:commentId, :reason, :email]

  field :commentId, 1, type: :int64
  field :reason, 2, type: :string
  field :email, 3, type: :string
end

defmodule Vuetaba.SpamResponse do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
    success:        boolean,
    localizedError: String.t
  }
  defstruct [:success, :localizedError]

  field :success, 1, type: :bool
  field :localizedError, 2, type: :string
end
