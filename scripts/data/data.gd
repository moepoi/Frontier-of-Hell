extends Node


const FILE_NAME = "user://data.foh"
const KEY = "NO_OPPAI_NO_LIFE"

func save_data(data):
	var file = FileAccess.open_encrypted_with_pass(FILE_NAME, FileAccess.WRITE, KEY)
	if file == null:
		print(FileAccess.get_open_error())
		return

	var json_string = JSON.stringify(data, "\t")
	file.store_string(json_string)
	file.close()

func load_data():
	if FileAccess.file_exists(FILE_NAME):
		var file = FileAccess.open_encrypted_with_pass(FILE_NAME, FileAccess.READ, KEY)
		if file == null:
			print(FileAccess.get_open_error())
			return

		var content = file.get_as_text()
		file.close()

		var data = JSON.parse_string(content)

		return data
	else:
		return null