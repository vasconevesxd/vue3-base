<template>
  <div
    @click="this.$refs.file.click()"
    class="mt-2 cursor-pointer flex justify-center rounded-md border-2 border-dashed border-gray-300 px-6 pt-5 pb-6">
    <div class="space-y-1 text-center">
      <div class="card">
        <ul class="list-group list-group-flush flex">
          <li class="list-group-item pr-5" v-for="(file, index) in fileInfos" :key="index">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              class="w-6 h-6">
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m2.25 0H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z" />
            </svg>
            <a :href="file.url">{{ file.name }}</a>
          </li>
        </ul>
      </div>
      <input
        name="file-upload"
        type="file"
        class="sr-only"
        ref="file"
        accept="{{this.acceptFiles}}"
        @change="handleFileChange($event)" />
      <svg
        class="mx-auto h-12 w-12 text-gray-400"
        stroke="currentColor"
        fill="none"
        viewBox="0 0 48 48"
        aria-hidden="true">
        <path
          d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round" />
      </svg>
      <div class="flex text-sm text-gray-600">
        <div class="relative cursor-pointer rounded-md bg-white font-medium">
          <span class="text-indigo-600">Upload a file</span>
        </div>
        <p class="pl-1">or drag and drop</p>
      </div>
      <p class="text-xs text-gray-500">PNG, JPG, GIF up to 10MB</p>
    </div>
  </div>
</template>

<script>
import readXlsxFile from 'read-excel-file'
import axios from 'axios'

export default {
  props: {
    acceptFiles: {
      type: String,
      default: null
    },
    endPoint: {
      type: String,
      default: null
    }
  },
  data() {
    return {
      selectedFiles: undefined,
      currentFile: undefined,
      progress: 0,
      message: '',
      fileInfos: []
    }
  },
  methods: {
    handleFileChange(event) {
      //this.fileInfos.push(event.target.files[0]);
      /*readXlsxFile(event.target.files[0]).then((rows) => {
        console.log(rows)
      })*/
    },
    async handleFileChange(event) {
      const file = event.target.files[0]
      const formData = new FormData()
      formData.append('file', file)

      try {
        this.uploading = true
        const res = await axios.post('/dropzone', formData, {
          onUploadProgress: (e) => (this.progress = Math.round((e.loaded * 100) / e.total))
        })

        this.uploadedFiles.push(res.data.file)
        this.uploading = false
      } catch (err) {
        this.message = err.response.data.error
        this.error = true
        this.uploading = false
      }
    }
    /*async sendFile() {
      const file = this.$refs.file.files[0]
      const formData = new FormData()
      formData.append('file', file)
      try {
        await axios.post('/dropzone', formData)
      } catch (err) {
        this.message = err.response.data.error
        this.error = true
      }
    }*/
  }
}
</script>
