<template>
    <div class="container mt-3">
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
    props: {
        datasets: {
            type: Array,
            default: () => [
                { label: 'Miền Bắc', color: '#41B883', value: 40 },
                { label: 'Miền Trung', color: '#E46651', value: 20 },
                { label: 'Miền Nam', color: '#00D8FF', value: 80 }
            ]
        }
    },
    data() {
        return {
            chartData: {
                labels: this.datasets.map((data) => data.label),
                datasets: [
                    {
                        backgroundColor: this.datasets.map(
                            (data) => data.color
                        ),
                        data: this.datasets.map((data) => data.value)
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
