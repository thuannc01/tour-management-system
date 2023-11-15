<template>
    <div class="container my-2">
        <h5 class="mb-2 text-center text-uppercase">
            Tổng Doanh thu theo thời gian và loại tour
        </h5>
        <Bar id="my-chart-id" :options="chartOptions" :data="chartData" />
    </div>
</template>

<script>
import { Bar } from 'vue-chartjs';
import {
    Chart as ChartJS,
    Title,
    Tooltip,
    Legend,
    BarElement,
    CategoryScale,
    LinearScale
} from 'chart.js';

ChartJS.register(
    Title,
    Tooltip,
    Legend,
    BarElement,
    CategoryScale,
    LinearScale
);

export default {
    name: 'BarChart',
    components: { Bar },
    data() {
        return {
            chartData: {
                labels: [
                    '1/2023',
                    '2/2023',
                    '3/2023',
                    '4/2023',
                    '5/2023',
                    '6/2023',
                    '7/2023',
                    '8/2023',
                    '9/2023',
                    '10/2023',
                    '11/2023',
                    '12/2023'
                ],
                datasets: [
                    {
                        label: 'Doanh thu tour ngắn ngày',
                        backgroundColor: '#f87979',
                        data: [40, 20, 12, 39, 10, 40, 39, 80, 40, 20, 12, 11]
                    },
                    {
                        label: 'Doanh thu tour dài ngày',
                        backgroundColor: '#7cb5ec',
                        data: [30, 10, 25, 50, 15, 30, 20, 60, 30, 15, 8, 10]
                    },
                    {
                        label: 'Tổng doanh thu',
                        backgroundColor: '#90ed7d',
                        data: [20, 5, 18, 35, 5, 20, 15, 40, 20, 8, 5, 5]
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
