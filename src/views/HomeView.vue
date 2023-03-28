<template>
  <main>
    <div class="px-10 py-3">
      <label class="block text-sm font-medium leading-6 text-gray-900">Excel File</label>
      <UploadField />
      <div class="overflow-x-auto mt-2.5">
        <tableStandard
          v-if="Object.keys(orcCheck.orc).length !== 0"
          :headers="orcCheck.orc.headers"
          :fields="orcCheck.orc.fields" />
        <button @click="orcCheck.getORCCheck">Click</button>
      </div>
    </div>
  </main>
</template>

<script>
import UploadField from '../components/atoms/UploadField.vue'
import tableStandard from '../components/molecules/TableStandard.vue'
import { useOrcCeck } from '../stores/orcCheck.js'

export default {
  components: { UploadField, tableStandard },
  setup() {
    const orcCheck = useOrcCeck()
    return { orcCheck }
  },
  data() {
    return {
      orc: []
    }
  }
}
</script>
