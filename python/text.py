from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.textinput import TextInput
from kivy.uix.button import Button
from kivy.uix.popup import Popup
from kivy.uix.label import Label
from kivy.uix.filechooser import FileChooserListView
from kivy.core.window import Window

Window.size = (800, 600)

class TextEditor(App):
    def build(self):
        self.text_input = TextInput(readonly=False, size_hint=(1, 0.9))
        self.open_button = Button(text="Open", size_hint=(0.5, 0.1))
        self.open_button.bind(on_press=self.open_file)
        self.save_button = Button(text="Save", size_hint=(0.5, 0.1))
        self.save_button.bind(on_press=self.save_file)
        
        layout = BoxLayout(orientation='vertical')
        layout.add_widget(self.text_input)
        button_layout = BoxLayout(orientation='horizontal', size_hint=(1, 0.1))
        button_layout.add_widget(self.open_button)
        button_layout.add_widget(self.save_button)
        layout.add_widget(button_layout)

        return layout

    def open_file(self, instance):
        content = FileChooserListView(path='.')
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
        filename = instance.text
        with open(filename, 'w') as f:
            f.write(self.text_input.text)
        instance.parent.parent.dismiss()

if __name__ == '__main__':
    TextEditor().run()

