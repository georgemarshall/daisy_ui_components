defmodule DaisyUIComponents.HTMLAttributes do
  @moduledoc false

  @input ~w(
    accept
    alt
    autocomplete
    autofocus
    capture
    checked
    dirname
    disabled
    enterkeyhint
    form
    formaction
    formenctype
    formmethod
    formnovalidate
    formtarget
    height
    inputmode
    list
    max
    maxlength
    min
    minlength
    multiple
    name
    pattern
    placeholder
    readonly
    required
    size
    src
    step
    type
    value
    width
  )

  @button ~w(
    autofocus
    disabled
    download
    form
    formaction
    formenctype
    formmethod
    formnovalidate
    formtarget
    href
    hreflang
    method
    name
    navigate
    patch
    ping
    referrerpolicy
    rel
    target
    type
    value
  )

  @select ~w(
    autofocus
    disabled
    form
    multiple
    name
    required
    size
  )

  @textarea ~w(
    autofocus
    autocomplete
    cols
    dirname
    disabled
    enterkeyhint
    form
    inputmode
    maxlength
    minlength
    name
    placeholder
    readonly
    required
    rows
    wrap
  )

  @form ~w(
    accept-charset
    action
    autocomplete
    enctype
    method
    name
    novalidate
    rel
    target
  )

  def input, do: @input
  def button, do: @button
  def select, do: @select
  def textarea, do: @textarea
  def form, do: @form

  def form_control do
    Enum.uniq(@input ++ @textarea ++ @select)
  end
end
