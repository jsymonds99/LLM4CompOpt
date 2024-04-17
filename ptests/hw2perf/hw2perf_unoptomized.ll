; ModuleID = 'llm4compoptperf.c'
source_filename = "llm4compoptperf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [1000 x i64], align 16
  %3 = alloca [1000 x i64], align 16
  %4 = alloca [1000 x i64], align 16
  %5 = alloca [1000 x i64], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  store i32 0, ptr %6, align 4
  br label %17

17:                                               ; preds = %41, %0
  %18 = load i32, ptr %6, align 4
  %19 = icmp slt i32 %18, 1000
  br i1 %19, label %20, label %44

20:                                               ; preds = %17
  %21 = load i32, ptr %6, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32, ptr %6, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %24
  store i64 %22, ptr %25, align 8
  %26 = load i32, ptr %6, align 4
  %27 = mul nsw i32 %26, 2
  %28 = sext i32 %27 to i64
  %29 = load i32, ptr %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %30
  store i64 %28, ptr %31, align 8
  %32 = load i32, ptr %6, align 4
  %33 = mul nsw i32 %32, 3
  %34 = sext i32 %33 to i64
  %35 = load i32, ptr %6, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %36
  store i64 %34, ptr %37, align 8
  %38 = load i32, ptr %6, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [1000 x i64], ptr %5, i64 0, i64 %39
  store i64 0, ptr %40, align 8
  br label %41

41:                                               ; preds = %20
  %42 = load i32, ptr %6, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %6, align 4
  br label %17, !llvm.loop !6

44:                                               ; preds = %17
  call void @srand(i32 noundef 4) #3
  store i32 5, ptr %7, align 4
  store i32 15, ptr %8, align 4
  store i32 0, ptr %9, align 4
  store i32 0, ptr %10, align 4
  store i32 0, ptr %6, align 4
  br label %45

45:                                               ; preds = %165, %44
  %46 = load i32, ptr %6, align 4
  %47 = icmp slt i32 %46, 1000000000
  br i1 %47, label %48, label %168

48:                                               ; preds = %45
  %49 = load i32, ptr %7, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %50
  %52 = load i64, ptr %51, align 8
  %53 = mul nsw i64 %52, 3
  %54 = mul nsw i64 %53, 29
  %55 = sdiv i64 %54, 4
  %56 = add nsw i64 %55, 23
  store i64 %56, ptr %11, align 8
  %57 = load i32, ptr %8, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %58
  %60 = load i64, ptr %59, align 8
  %61 = mul nsw i64 %60, 7
  %62 = mul nsw i64 %61, 33
  %63 = sdiv i64 %62, 3
  %64 = add nsw i64 %63, 59
  store i64 %64, ptr %12, align 8
  %65 = load i64, ptr %11, align 8
  %66 = load i64, ptr %12, align 8
  %67 = add nsw i64 %65, %66
  %68 = srem i64 %67, 1000
  %69 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %68
  %70 = load i64, ptr %69, align 8
  %71 = load i32, ptr %7, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %72
  %74 = load i64, ptr %73, align 8
  %75 = add nsw i64 %70, %74
  %76 = load i32, ptr %8, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %77
  %79 = load i64, ptr %78, align 8
  %80 = add nsw i64 %75, %79
  store i64 %80, ptr %13, align 8
  %81 = load i64, ptr %11, align 8
  %82 = mul nsw i64 %81, 11
  %83 = load i64, ptr %12, align 8
  %84 = mul nsw i64 %83, 13
  %85 = add nsw i64 %82, %84
  %86 = load i64, ptr %13, align 8
  %87 = mul nsw i64 %86, 17
  %88 = add nsw i64 %85, %87
  %89 = load i32, ptr %6, align 4
  %90 = sext i32 %89 to i64
  %91 = add nsw i64 %88, %90
  %92 = load i32, ptr %6, align 4
  %93 = srem i32 %92, 1000
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [1000 x i64], ptr %5, i64 0, i64 %94
  store i64 %91, ptr %95, align 8
  %96 = load i32, ptr %6, align 4
  %97 = icmp slt i32 %96, 100
  br i1 %97, label %98, label %164

98:                                               ; preds = %48
  store i32 0, ptr %9, align 4
  br label %99

99:                                               ; preds = %153, %98
  %100 = load i32, ptr %9, align 4
  %101 = icmp slt i32 %100, 1000000
  br i1 %101, label %102, label %156

102:                                              ; preds = %99
  %103 = load i32, ptr %10, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %104
  %106 = load i64, ptr %105, align 8
  %107 = mul nsw i64 %106, 6
  %108 = load i32, ptr %10, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %109
  %111 = load i64, ptr %110, align 8
  %112 = sdiv i64 %111, 2
  %113 = add nsw i64 %107, %112
  store i64 %113, ptr %14, align 8
  %114 = load i64, ptr %14, align 8
  %115 = srem i64 %114, 1000
  %116 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %115
  %117 = load i64, ptr %116, align 8
  %118 = mul nsw i64 2, %117
  %119 = load i32, ptr %10, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %120
  %122 = load i64, ptr %121, align 8
  %123 = mul nsw i64 4, %122
  %124 = add nsw i64 %118, %123
  store i64 %124, ptr %15, align 8
  %125 = load i64, ptr %15, align 8
  %126 = srem i64 %125, 1000
  %127 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %126
  %128 = load i64, ptr %127, align 8
  %129 = mul nsw i64 6, %128
  %130 = load i32, ptr %10, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %131
  %133 = load i64, ptr %132, align 8
  %134 = mul nsw i64 %133, 3
  %135 = add nsw i64 %129, %134
  store i64 %135, ptr %16, align 8
  %136 = load i64, ptr %14, align 8
  %137 = load i64, ptr %15, align 8
  %138 = add nsw i64 %136, %137
  %139 = load i64, ptr %16, align 8
  %140 = mul nsw i64 %139, 2
  %141 = add nsw i64 %138, %140
  %142 = load i32, ptr %9, align 4
  %143 = sext i32 %142 to i64
  %144 = add nsw i64 %141, %143
  %145 = load i32, ptr %9, align 4
  %146 = srem i32 %145, 100
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [1000 x i64], ptr %5, i64 0, i64 %147
  store i64 %144, ptr %148, align 8
  %149 = load i32, ptr %9, align 4
  %150 = icmp slt i32 %149, 10
  br i1 %150, label %151, label %152

151:                                              ; preds = %102
  store i32 59, ptr %10, align 4
  br label %152

152:                                              ; preds = %151, %102
  br label %153

153:                                              ; preds = %152
  %154 = load i32, ptr %9, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, ptr %9, align 4
  br label %99, !llvm.loop !8

156:                                              ; preds = %99
  %157 = load i32, ptr %6, align 4
  %158 = icmp eq i32 %157, 0
  br i1 %158, label %159, label %162

159:                                              ; preds = %156
  %160 = call i32 @rand() #3
  %161 = srem i32 %160, 1000
  store i32 %161, ptr %7, align 4
  br label %163

162:                                              ; preds = %156
  store i32 37, ptr %8, align 4
  br label %163

163:                                              ; preds = %162, %159
  br label %164

164:                                              ; preds = %163, %48
  br label %165

165:                                              ; preds = %164
  %166 = load i32, ptr %6, align 4
  %167 = add nsw i32 %166, 1
  store i32 %167, ptr %6, align 4
  br label %45, !llvm.loop !9

168:                                              ; preds = %45
  store i32 0, ptr %6, align 4
  br label %169

169:                                              ; preds = %178, %168
  %170 = load i32, ptr %6, align 4
  %171 = icmp slt i32 %170, 1000
  br i1 %171, label %172, label %181

172:                                              ; preds = %169
  %173 = load i32, ptr %6, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [1000 x i64], ptr %5, i64 0, i64 %174
  %176 = load i64, ptr %175, align 8
  %177 = call i32 (ptr, ...) @printf(ptr noundef @.str, i64 noundef %176)
  br label %178

178:                                              ; preds = %172
  %179 = load i32, ptr %6, align 4
  %180 = add nsw i32 %179, 1
  store i32 %180, ptr %6, align 4
  br label %169, !llvm.loop !10

181:                                              ; preds = %169
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
