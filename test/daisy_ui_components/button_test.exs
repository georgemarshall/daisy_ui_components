defmodule DaisyUIComponents.ButtonTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Button

  alias DaisyUIComponents.Utils

  test "button" do
    assigns = %{}

    button =
      rendered_to_string(~H"""
      <.button>button slot</.button>
      """)

    assert button =~ ~s(<button class="btn">)
    assert button =~ ~s(button slot)
  end

  test "button colors" do
    for color <- Utils.colors() ++ ["neutral"] do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.button color={@color}>My button</.button>
             """) =~ ~s(<button class="btn btn-#{color}">)
    end
  end

  test "button sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.button size={@size}>My button</.button>
             """) =~ ~s(<button class="btn btn-#{size}">)
    end
  end

  test "button shapes" do
    for shape <- ~w(circle square) do
      assigns = %{shape: shape}

      assert rendered_to_string(~H"""
             <.button shape={@shape} {assigns}>My button</.button>
             """) =~ ~s(<button class="btn btn-#{shape}">)
    end
  end

  test "button boolean assigns" do
    for boolean_assign <- ~w(ghost link soft dash outline active disabled glass wide block)a do
      assigns = %{boolean_assign => true}

      assert rendered_to_string(~H"""
             <.button {assigns}>My button</.button>
             """) =~ ~s(<button class="btn btn-#{to_string(boolean_assign)}">)
    end

    assigns = %{loading: true}

    assert rendered_to_string(~H"""
           <.button {assigns}>My button</.button>
           """) =~ ~s(<button class="btn loading">)

    assigns = %{no_animation: true}

    assert rendered_to_string(~H"""
           <.button {assigns}>My button</.button>
           """) =~ ~s(<button class="btn no-animation">)
  end

  test "button forwards standard attributes" do
    assigns = %{}

    button =
      rendered_to_string(~H"""
      <.button
        type="submit"
        form="user-form"
        formaction="/users"
        formenctype="multipart/form-data"
        formmethod="post"
        formnovalidate
        formtarget="_blank"
        name="save"
        value="yes"
        aria-label="Save"
      >Save</.button>
      """)

    assert button =~ ~s(type="submit")
    assert button =~ ~s(form="user-form")
    assert button =~ ~s(formaction="/users")
    assert button =~ ~s(formenctype="multipart/form-data")
    assert button =~ ~s(formmethod="post")
    assert button =~ ~s(formnovalidate)
    assert button =~ ~s(formtarget="_blank")
    assert button =~ ~s(name="save")
    assert button =~ ~s(value="yes")
    assert button =~ ~s(aria-label="Save")

    link_button =
      rendered_to_string(~H"""
      <.button
        href="/users"
        target="_blank"
        rel="noopener"
        download
        ping="/track"
        referrerpolicy="no-referrer"
      >Link</.button>
      """)

    assert link_button =~ ~s(href="/users")
    assert link_button =~ ~s(target="_blank")
    assert link_button =~ ~s(rel="noopener")
    assert link_button =~ ~s(download)
    assert link_button =~ ~s(ping="/track")
    assert link_button =~ ~s(referrerpolicy="no-referrer")
  end
end
