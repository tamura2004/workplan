function select (query) {
  const cell = document.getElementById(query)
  if (cell !== null) cell.select()
}

export default function moveWithArrowKey (e, cellId) {
  switch (e.code) {
    case 'ArrowRight': select(cellId(1, 0)); break
    case 'ArrowLeft': select(cellId(-1, 0)); break
    case 'ArrowUp': select(cellId(0, -1)); break
    case 'ArrowDown': select(cellId(0, 1)); break
  }
}
