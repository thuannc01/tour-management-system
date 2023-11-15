<template>
    <div class="container mt-2">
        <h5 class="mb-2 text-center text-uppercase">
            Doanh thu theo vùng miền
        </h5>
        <Pie id="my-chart-id" :options="chartOptions" :data="chartData" />
    </div>
</template>

<script>
import { Pie } from 'vue-chartjs';
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js';
ChartJS.register(ArcElement, Tooltip, Legend);

export default {
    name: 'PieChart',
    components: { Pie },
    data() {
        return {
            chartData: {
                labels: ['Miền Bắc', 'Miền Trung', 'Miền Nam'],
                datasets: [
                    {
                        backgroundColor: ['#41B883', '#E46651', '#00D8FF'],
                        data: [40, 20, 80]
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
