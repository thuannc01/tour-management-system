<template>
    <div class="container mb-2">
        <h5 class="mb-2 text-center text-uppercase">
            Tỷ lệ người lớn, trẻ em và em bé trong tour
        </h5>
        <Doughnut id="my-chart-id" :options="chartOptions" :data="chartData" />
    </div>
</template>

<script>
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js';
import { Doughnut } from 'vue-chartjs';
ChartJS.register(ArcElement, Tooltip, Legend);
export default {
    name: 'DoughnutChart',
    components: { Doughnut },
    data() {
        return {
            chartData: {
                labels: ['Người lớn', 'Trẻ em', 'Em bé'],
                datasets: [
                    {
                        backgroundColor: ['#41B883', '#E46651', '#00D8FF'],
                        data: [80, 20, 20]
                    }
                ]
            },
            chartOptions: {
                responsive: true
            }
        };
    }
};
</script>
