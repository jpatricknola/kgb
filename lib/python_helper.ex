defmodule Kgb.PythonHelper do
  @doc """
  ## Parameters
    - path: directory to include in python path (charlist)
  """
  def python_instance(path) when is_list(path) do
    {:ok, pid} = :python.start([{:python_path, to_charlist(path)}])
    pid
  end

  def python_instance(_) do
    {:ok, pid} = :python.start()
    pid
  end

  def call_python(pid, module, function, arguments \\ []) do
    :python.call(pid, module, function, arguments)
  end
end
