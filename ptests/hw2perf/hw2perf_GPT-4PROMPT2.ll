; ModuleID = 'hw2perf_unoptimized.ll'
source_filename = "hw2perf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000 x i64], align 16
  %2 = alloca [1000 x i64], align 16
  %3 = alloca [1000 x i64], align 16
  %4 = alloca [1000 x i64], align 16
  br label %5

5:                                                ; preds = %21, %0
  %.01 = phi i32 [ 0, %0 ], [ %22, %21 ]
  %6 = icmp slt i32 %.01, 1000
  br i1 %6, label %7, label %23

7:                                                ; preds = %5
  %8 = sext i32 %.01 to i64
  %9 = sext i32 %.01 to i64
  %10 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %9
  store i64 %8, ptr %10, align 8
  %11 = mul nsw i32 %.01, 2
  %12 = sext i32 %11 to i64
  %13 = sext i32 %.01 to i64
  %14 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %13
  store i64 %12, ptr %14, align 8
  %15 = mul nsw i32 %.01, 3
  %16 = sext i32 %15 to i64
  %17 = sext i32 %.01 to i64
  %18 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %17
  store i64 %16, ptr %18, align 8
  %19 = sext i32 %.01 to i64
  %20 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %19
  store i64 0, ptr %20, align 8
  br label %21

21:                                               ; preds = %7
  %22 = add nsw i32 %.01, 1
  br label %5, !llvm.loop !6

23:                                               ; preds = %5
  call void @srand(i32 noundef 4) #3
  br label %24

24:                                               ; preds = %116, %23
  %.07 = phi i32 [ 15, %23 ], [ %.29, %116 ]
  %.04 = phi i32 [ 5, %23 ], [ %.26, %116 ]
  %.12 = phi i32 [ 0, %23 ], [ %117, %116 ]
  %.0 = phi i32 [ 0, %23 ], [ %.3, %116 ]
  %25 = icmp slt i32 %.12, 1000000000
  br i1 %25, label %26, label %118

26:                                               ; preds = %24
  %27 = sext i32 %.04 to i64
  %28 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %27
  %29 = load i64, ptr %28, align 8
  %30 = mul nsw i64 %29, 3
  %31 = mul nsw i64 %30, 29
  %32 = sdiv i64 %31, 4
  %33 = add nsw i64 %32, 23
  %34 = sext i32 %.07 to i64
  %35 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %34
  %36 = load i64, ptr %35, align 8
  %37 = mul nsw i64 %36, 7
  %38 = mul nsw i64 %37, 33
  %39 = sdiv i64 %38, 3
  %40 = add nsw i64 %39, 59
  %41 = add nsw i64 %33, %40
  %42 = srem i64 %41, 1000
  %43 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %42
  %44 = load i64, ptr %43, align 8
  %45 = sext i32 %.04 to i64
  %46 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %45
  %47 = load i64, ptr %46, align 8
  %48 = add nsw i64 %44, %47
  %49 = sext i32 %.07 to i64
  %50 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %49
  %51 = load i64, ptr %50, align 8
  %52 = add nsw i64 %48, %51
  %53 = mul nsw i64 %33, 11
  %54 = mul nsw i64 %40, 13
  %55 = add nsw i64 %53, %54
  %56 = mul nsw i64 %52, 17
  %57 = add nsw i64 %55, %56
  %58 = sext i32 %.12 to i64
  %59 = add nsw i64 %57, %58
  %60 = srem i32 %.12, 1000
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %61
  store i64 %59, ptr %62, align 8
  %63 = icmp slt i32 %.12, 100
  br i1 %63, label %64, label %115

64:                                               ; preds = %26
  br label %65

65:                                               ; preds = %106, %64
  %.010 = phi i32 [ 0, %64 ], [ %107, %106 ]
  %.1 = phi i32 [ %.0, %64 ], [ %.2, %106 ]
  %66 = icmp slt i32 %.010, 1000000
  br i1 %66, label %67, label %108

67:                                               ; preds = %65
  %68 = sext i32 %.1 to i64
  %69 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %68
  %70 = load i64, ptr %69, align 8
  %71 = mul nsw i64 %70, 6
  %72 = sext i32 %.1 to i64
  %73 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %72
  %74 = load i64, ptr %73, align 8
  %75 = sdiv i64 %74, 2
  %76 = add nsw i64 %71, %75
  %77 = srem i64 %76, 1000
  %78 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %77
  %79 = load i64, ptr %78, align 8
  %80 = mul nsw i64 2, %79
  %81 = sext i32 %.1 to i64
  %82 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %81
  %83 = load i64, ptr %82, align 8
  %84 = mul nsw i64 4, %83
  %85 = add nsw i64 %80, %84
  %86 = srem i64 %85, 1000
  %87 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %86
  %88 = load i64, ptr %87, align 8
  %89 = mul nsw i64 6, %88
  %90 = sext i32 %.1 to i64
  %91 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %90
  %92 = load i64, ptr %91, align 8
  %93 = mul nsw i64 %92, 3
  %94 = add nsw i64 %89, %93
  %95 = add nsw i64 %76, %85
  %96 = mul nsw i64 %94, 2
  %97 = add nsw i64 %95, %96
  %98 = sext i32 %.010 to i64
  %99 = add nsw i64 %97, %98
  %100 = srem i32 %.010, 100
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %101
  store i64 %99, ptr %102, align 8
  %103 = icmp slt i32 %.010, 10
  br i1 %103, label %104, label %105

104:                                              ; preds = %67
  br label %105

105:                                              ; preds = %104, %67
  %.2 = phi i32 [ 59, %104 ], [ %.1, %67 ]
  br label %106

106:                                              ; preds = %105
  %107 = add nsw i32 %.010, 1
  br label %65, !llvm.loop !8

108:                                              ; preds = %65
  %109 = icmp eq i32 %.12, 0
  br i1 %109, label %110, label %113

110:                                              ; preds = %108
  %111 = call i32 @rand() #3
  %112 = srem i32 %111, 1000
  br label %114

113:                                              ; preds = %108
  br label %114

114:                                              ; preds = %113, %110
  %.18 = phi i32 [ %.07, %110 ], [ 37, %113 ]
  %.15 = phi i32 [ %112, %110 ], [ %.04, %113 ]
  br label %115

115:                                              ; preds = %114, %26
  %.29 = phi i32 [ %.18, %114 ], [ %.07, %26 ]
  %.26 = phi i32 [ %.15, %114 ], [ %.04, %26 ]
  %.3 = phi i32 [ %.1, %114 ], [ %.0, %26 ]
  br label %116

116:                                              ; preds = %115
  %117 = add nsw i32 %.12, 1
  br label %24, !llvm.loop !9

118:                                              ; preds = %24
  br label %119

119:                                              ; preds = %126, %118
  %.23 = phi i32 [ 0, %118 ], [ %127, %126 ]
  %120 = icmp slt i32 %.23, 1000
  br i1 %120, label %121, label %128

121:                                              ; preds = %119
  %122 = sext i32 %.23 to i64
  %123 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %122
  %124 = load i64, ptr %123, align 8
  %125 = call i32 (ptr, ...) @printf(ptr noundef @.str, i64 noundef %124)
  br label %126

126:                                              ; preds = %121
  %127 = add nsw i32 %.23, 1
  br label %119, !llvm.loop !10

128:                                              ; preds = %119
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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
