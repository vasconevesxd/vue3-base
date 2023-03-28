<template>
  <table class="table w-full">
    <thead>
      <tr>
        <th v-for="(column, index) in headers" :key="`header-${index}`">
          {{ column }}
        </th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="(item, index) in paginatedItems" :key="`content-${index}`">
        <td v-for="(column, indexColumn) in headers" :key="`contentValue-${index}`">
          {{ item[column] }}
        </td>
      </tr>
    </tbody>
  </table>
  <Pagination
    :current="this.currentPage"
    :total="fields.length"
    :per-page="this.perPage"
    @page-changed="this.currentPage = $event" />
</template>

<script>
import Pagination from '../atoms/Pagination.vue'
export default {
  components: {
    Pagination
  },
  props: {
    headers: {
      type: Array,
      required: true
    },
    fields: {
      type: Array,
      required: true
    }
  },
  data() {
    return {
      currentPage: 1,
      perPage: 20
    }
  },
  computed: {
    paginatedItems() {
      const start = (this.currentPage - 1) * this.perPage
      let items = this.fields
      const stop = start + this.perPage
      return items.slice(start, stop)
    }
  }
}
</script>
