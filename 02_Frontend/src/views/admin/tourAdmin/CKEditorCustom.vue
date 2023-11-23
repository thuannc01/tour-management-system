<template>
    <ckeditor
        :editor="editor"
        v-model="editorData"
        :config="editorConfig"
        ref="myEditor"
    ></ckeditor>
</template>

<script>
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { defineComponent, ref, watch } from '@vue/runtime-core';
import axios from 'axios';
import store from '@/store';

export default defineComponent({
    props: {
        modelValue: {
            type: String,
            default: '<p>Default content.</p>'
        }
    },
    emits: ['update:modelValue'],

    setup(props, { emit }) {
        const editorData = ref(props.modelValue);
        const myEditor = ref(null);

        const editorConfig = {
            extraPlugins: [MyCustomUploadAdapterPlugin]
        };

        watch(
            () => editorData.value,
            (newValue) => {
                emit('update:modelValue', newValue);
                if (!newValue.trim()) {
                    clearEditor();
                }
            }
        );

        const clearEditor = () => {
            if (myEditor.value) {
                myEditor.value.setData('');
            }
        };

        return {
            editor: ClassicEditor,
            editorData,
            editorConfig,
            myEditor
        };
    },
    methods: {
        //
    }
});

class MyCustomUploadAdapter {
    constructor(loader) {
        this.loader = loader;
    }

    upload() {
        const CLOUD_NAME = 'dih79o7tn';
        const PRESET_NAME = 'thuan_tourist';
        const FOLDER_NAME = 'thuan_tourist';
        const api = `https://api.cloudinary.com/v1_1/${CLOUD_NAME}/image/upload`;

        return this.loader.file.then(
            (file) =>
                new Promise((resolve, reject) => {
                    const formData = new FormData();
                    formData.append('upload_preset', PRESET_NAME);
                    formData.append('folder', FOLDER_NAME);
                    formData.append('file', file);
                    store.commit('app/showLoading');
                    axios
                        .post(api, formData)
                        .then((response) => {
                            store.commit('app/hideLoading');
                            resolve({ default: response.data.secure_url });
                        })
                        .catch((error) => {
                            console.error(error);
                            reject('Upload failed');
                        });
                })
        );
    }

    abort() {
        //
    }
}

// add plugin into CKEditor
function MyCustomUploadAdapterPlugin(editor) {
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
        return new MyCustomUploadAdapter(loader);
    };
}
</script>
