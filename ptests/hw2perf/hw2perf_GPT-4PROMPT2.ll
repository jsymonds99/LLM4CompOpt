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

5:                                                ; preds = %5, %0
  %6 = phi i32 [ 0, %0 ], [ %26, %5 ]
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %7
  store i64 %7, ptr %8, align 8
  %9 = shl nuw nsw i32 %6, 1
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %7
  store i64 %10, ptr %11, align 8
  %12 = mul nuw nsw i32 %6, 3
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %7
  store i64 %13, ptr %14, align 8
  %15 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %7
  store i64 0, ptr %15, align 8
  %16 = add nuw nsw i32 %6, 1
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %17
  store i64 %17, ptr %18, align 8
  %19 = shl nuw nsw i32 %16, 1
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %17
  store i64 %20, ptr %21, align 8
  %22 = mul nuw nsw i32 %16, 3
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %17
  store i64 %23, ptr %24, align 8
  %25 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %17
  store i64 0, ptr %25, align 8
  %26 = add nuw nsw i32 %6, 2
  %27 = icmp ult i32 %26, 1000
  br i1 %27, label %5, label %28, !llvm.loop !6

28:                                               ; preds = %5
  call void @srand(i32 noundef 4) #3
  br label %29

29:                                               ; preds = %28, %117
  %30 = phi i32 [ 0, %28 ], [ %122, %117 ]
  %31 = phi i32 [ 5, %28 ], [ %121, %117 ]
  %32 = phi i32 [ 15, %28 ], [ %120, %117 ]
  %33 = phi i32 [ 0, %28 ], [ %119, %117 ]
  %34 = phi i32 [ 0, %28 ], [ %118, %117 ]
  %35 = sext i32 %31 to i64
  %36 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %35
  %37 = load i64, ptr %36, align 8
  %38 = mul i64 %37, 87
  %39 = sdiv i64 %38, 4
  %40 = add nsw i64 %39, 23
  %41 = sext i32 %32 to i64
  %42 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %41
  %43 = load i64, ptr %42, align 8
  %44 = mul i64 %43, 231
  %45 = sdiv i64 %44, 3
  %46 = add nsw i64 %45, 59
  %47 = add nsw i64 %40, %46
  %48 = srem i64 %47, 1000
  %49 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %48
  %50 = load i64, ptr %49, align 8
  %51 = load i64, ptr %36, align 8
  %52 = add nsw i64 %50, %51
  %53 = load i64, ptr %42, align 8
  %54 = add nsw i64 %52, %53
  %55 = mul nsw i64 %40, 11
  %56 = mul nsw i64 %46, 13
  %57 = add nsw i64 %55, %56
  %58 = mul nsw i64 %54, 17
  %59 = add nsw i64 %57, %58
  %60 = zext i32 %30 to i64
  %61 = add nsw i64 %59, %60
  %62 = urem i32 %30, 1000
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %63
  store i64 %61, ptr %64, align 8
  %65 = icmp ult i32 %30, 100
  br i1 %65, label %66, label %117

66:                                               ; preds = %29
  br label %67

67:                                               ; preds = %66, %104
  %68 = phi i32 [ 0, %66 ], [ %106, %104 ]
  %69 = phi i32 [ %33, %66 ], [ %105, %104 ]
  %70 = phi i32 [ %34, %66 ], [ %105, %104 ]
  %71 = sext i32 %69 to i64
  %72 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %71
  %73 = load i64, ptr %72, align 8
  %74 = mul nsw i64 %73, 6
  %75 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %71
  %76 = load i64, ptr %75, align 8
  %77 = sdiv i64 %76, 2
  %78 = add nsw i64 %74, %77
  %79 = srem i64 %78, 1000
  %80 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %79
  %81 = load i64, ptr %80, align 8
  %82 = shl nsw i64 %81, 1
  %83 = shl nsw i64 %73, 2
  %84 = add nsw i64 %82, %83
  %85 = srem i64 %84, 1000
  %86 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %85
  %87 = load i64, ptr %86, align 16
  %88 = mul nsw i64 %87, 6
  %89 = sext i32 %70 to i64
  %90 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %89
  %91 = load i64, ptr %90, align 8
  %92 = mul nsw i64 %91, 3
  %93 = add nsw i64 %88, %92
  %94 = add nsw i64 %78, %84
  %95 = shl nsw i64 %93, 1
  %96 = add nsw i64 %94, %95
  %97 = zext i32 %68 to i64
  %98 = add nsw i64 %96, %97
  %99 = urem i32 %68, 100
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %100
  store i64 %98, ptr %101, align 8
  %102 = icmp ult i32 %68, 10
  br i1 %102, label %103, label %104

103:                                              ; preds = %67
  br label %104

104:                                              ; preds = %103, %67
  %105 = phi i32 [ 59, %103 ], [ %70, %67 ]
  %106 = add nuw nsw i32 %68, 1
  %107 = icmp ult i32 %106, 1000000
  br i1 %107, label %67, label %108, !llvm.loop !8

108:                                              ; preds = %104
  %.lcssa1 = phi i32 [ %105, %104 ]
  %.lcssa = phi i32 [ %105, %104 ]
  %109 = icmp eq i32 %30, 0
  br i1 %109, label %110, label %113

110:                                              ; preds = %108
  %111 = call i32 @rand() #3
  %112 = srem i32 %111, 1000
  br label %114

113:                                              ; preds = %108
  br label %114

114:                                              ; preds = %113, %110
  %115 = phi i32 [ 37, %113 ], [ %32, %110 ]
  %116 = phi i32 [ %31, %113 ], [ %112, %110 ]
  br label %117

117:                                              ; preds = %114, %29
  %118 = phi i32 [ %.lcssa1, %114 ], [ %34, %29 ]
  %119 = phi i32 [ %.lcssa, %114 ], [ %33, %29 ]
  %120 = phi i32 [ %115, %114 ], [ %32, %29 ]
  %121 = phi i32 [ %116, %114 ], [ %31, %29 ]
  %122 = add nuw nsw i32 %30, 1
  %123 = icmp ult i32 %122, 1000000000
  br i1 %123, label %29, label %124, !llvm.loop !9

124:                                              ; preds = %117
  br label %125

125:                                              ; preds = %124, %125
  %126 = phi i32 [ 0, %124 ], [ %131, %125 ]
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %127
  %129 = load i64, ptr %128, align 8
  %130 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %129) #3
  %131 = add nuw nsw i32 %126, 1
  %132 = icmp ult i32 %131, 1000
  br i1 %132, label %125, label %133, !llvm.loop !10

133:                                              ; preds = %125
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
