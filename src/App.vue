<script setup>
import { RouterView } from 'vue-router'
import Navbar from './components/base/Navbar.vue'
import Footer from './components/base/Footer.vue'
</script>

<template>
  <Navbar />
  <RouterView />
  <Footer />
</template>
