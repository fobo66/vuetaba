defmodule Vuetaba.Comment do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: non_neg_integer,
          parent: non_neg_integer,
          lasthit: non_neg_integer,
          ip: String.t(),
          name: String.t(),
          tripcode: String.t(),
          password: String.t(),
          comment: String.t(),
          sage: boolean,
          lang: String.t(),
          attachments: [Vuetaba.Attachment.t()]
        }
  defstruct [
    :id,
    :parent,
    :lasthit,
    :ip,
    :name,
    :tripcode,
    :password,
    :comment,
    :sage,
    :lang,
    :attachments
  ]

  field(:id, 1, type: :uint64)
  field(:parent, 2, type: :uint64)
  field(:lasthit, 3, type: :uint64)
  field(:ip, 4, type: :string)
  field(:name, 5, type: :string)
  field(:tripcode, 6, type: :string)
  field(:password, 7, type: :string)
  field(:comment, 8, type: :string)
  field(:sage, 9, type: :bool)
  field(:lang, 10, type: :string)
  field(:attachments, 11, repeated: true, type: Vuetaba.Attachment)
end

defmodule Vuetaba.Attachment do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          url: String.t(),
          previewUrl: String.t()
        }
  defstruct [:url, :previewUrl]

  field(:url, 1, type: :string)
  field(:previewUrl, 2, type: :string)
end

defmodule Vuetaba.ThreadRequest do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          rootCommentId: non_neg_integer,
          timestamp: non_neg_integer
        }
  defstruct [:rootCommentId, :timestamp]

  field(:rootCommentId, 1, type: :uint64)
  field(:timestamp, 2, type: :uint64)
end
