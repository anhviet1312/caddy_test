# Sử dụng image Golang chính thức
FROM golang:1.22

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Sao chép file Go mod và sum để cài đặt các gói phụ thuộc
COPY go.mod go.sum ./

# Tải các gói phụ thuộc
RUN go mod download

# Sao chép tất cả các file trong thư mục hiện tại vào thư mục làm việc trong container
COPY . .

# Xây dựng ứng dụng
RUN go build -o main .

# Chạy ứng dụng
CMD ["./main"]
