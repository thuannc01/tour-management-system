<template>
    <ckeditor
        :editor="editor"
        v-model="editorData"
        :config="editorConfig"
    ></ckeditor>
</template>

<script>
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { defineComponent, ref } from '@vue/runtime-core';

export default defineComponent({
    setup() {
        const editorData = ref('<p>Content of the editor.</p>');

        return {
            editor: ClassicEditor,
            editorData,
            editorConfig: {}
        };
    }
});
</script>
