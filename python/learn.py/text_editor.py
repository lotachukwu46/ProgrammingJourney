from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button
from kivy.uix.popup import Popup
from kivy.uix.filechooser import FileChooserListView

class TextEditor(App):
    def build(self):
        layout = BoxLayout(orientation='vertical')

        self.text_input = TextInput(readonly=False, size_hint=(1, 0.9))
        layout.add_widget(self.text_input)

        buttons_layout = BoxLayout(size_hint=(1, 0.1))
        layout.add_widget(buttons_layout)

        open_button = Button(text="Open")
        open_button.bind(on_press=self.open_file)
        buttons_layout.add_widget(open_button)

        save_button = Button(text="Save")
        save_button.bind(on_press=self.save_file)
        buttons_layout.add_widget(save_button)

        return layout

    def open_file(self, instance):
        content = FileChooserListView(path=('.'))
        content.bind(on_submit=self.load_file)
        popup = Popup(title='Open File', content=content, size_hint=(0.9, 0.9))
        popup.open()

    def load_file(self, instance, path, filename):
        with open(filename[0], 'r') as f:
            self.text_input.text = f.read()
        instance.parent.parent.parent.dismiss()
    def save_file(self, instance):
        content = TextInput(text='Enter file name:', multiline=False)
        content.bind(on_text_validate=self.save)
        popup = Popup(title='Save File', content=content, size_hint=(0.5, 0.3))
        popup.open()

    def save(self, instance):
        filename = instance.txt
        with open(filename, 'w') as f:
            f.write(self.text_input.text)
        instance.parent.parent.dismiss()

if __name__ == '__main__':
    TextEditor().run()

