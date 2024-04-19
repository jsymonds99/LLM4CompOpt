; ModuleID = 'hw2perf_unoptimized.ll'
source_filename = "hw2perf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@0 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000 x i64], align 16
  %2 = alloca [1000 x i64], align 16
  %3 = alloca [1000 x i64], align 16
  %4 = alloca [1000 x i64], align 16
  br label %5

5:                                                ; preds = %8, %0
  %6 = phi i32 [ 0, %0 ], [ %18, %8 ]
  %7 = icmp slt i32 %6, 1000
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = sext i32 %6 to i64
  %10 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %9
  store i64 %9, ptr %10, align 8
  %11 = shl nsw i32 %6, 1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %9
  store i64 %12, ptr %13, align 8
  %14 = mul nsw i32 %6, 3
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %9
  store i64 %15, ptr %16, align 8
  %17 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %9
  store i64 0, ptr %17, align 8
  %18 = add nsw i32 %6, 1
  br label %5, !llvm.loop !6

19:                                               ; preds = %5
  call void @srand(i32 noundef 4) #3
  br label %20

20:                                               ; preds = %108, %19
  %21 = phi i32 [ 0, %19 ], [ %109, %108 ]
  %22 = phi i32 [ 0, %19 ], [ %110, %108 ]
  %23 = phi i32 [ 15, %19 ], [ %111, %108 ]
  %24 = phi i32 [ 5, %19 ], [ %112, %108 ]
  %25 = phi i32 [ 0, %19 ], [ %113, %108 ]
  %26 = icmp slt i32 %25, 1000000000
  br i1 %26, label %27, label %114

27:                                               ; preds = %20
  %28 = sext i32 %24 to i64
  %29 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %28
  %30 = load i64, ptr %29, align 8
  %31 = mul i64 %30, 87
  %32 = sdiv i64 %31, 4
  %33 = add nsw i64 %32, 23
  %34 = zext i32 %23 to i64
  %35 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %34
  %36 = load i64, ptr %35, align 8
  %37 = mul i64 %36, 231
  %38 = sdiv i64 %37, 3
  %39 = add nsw i64 %38, 59
  %40 = add nsw i64 %39, %33
  %41 = srem i64 %40, 1000
  %42 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %41
  %43 = load i64, ptr %42, align 8
  %44 = load i64, ptr %29, align 8
  %45 = add nsw i64 %44, %43
  %46 = load i64, ptr %35, align 8
  %47 = add nsw i64 %45, %46
  %48 = mul nsw i64 %33, 11
  %49 = mul nsw i64 %39, 13
  %50 = mul nsw i64 %47, 17
  %51 = sext i32 %25 to i64
  %52 = add i64 %50, %48
  %53 = add i64 %52, %49
  %54 = add nsw i64 %53, %51
  %55 = srem i32 %25, 1000
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %56
  store i64 %54, ptr %57, align 8
  %58 = icmp slt i32 %25, 100
  br i1 %58, label %59, label %108

59:                                               ; preds = %27
  br label %60

60:                                               ; preds = %99, %59
  %61 = phi i32 [ %21, %59 ], [ %100, %99 ]
  %62 = phi i32 [ %22, %59 ], [ %100, %99 ]
  %63 = phi i32 [ 0, %59 ], [ %101, %99 ]
  %64 = icmp slt i32 %63, 1000000
  br i1 %64, label %65, label %102

65:                                               ; preds = %60
  %66 = zext i32 %62 to i64
  %67 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %66
  %68 = load i64, ptr %67, align 8
  %69 = mul nsw i64 %68, 6
  %70 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %66
  %71 = load i64, ptr %70, align 8
  %72 = sdiv i64 %71, 2
  %73 = add nsw i64 %72, %69
  %74 = srem i64 %73, 1000
  %75 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %74
  %76 = load i64, ptr %75, align 8
  %77 = shl nsw i64 %76, 1
  %78 = shl nsw i64 %68, 2
  %79 = add nsw i64 %78, %77
  %80 = srem i64 %79, 1000
  %81 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %80
  %82 = load i64, ptr %81, align 16
  %83 = mul nsw i64 %82, 6
  %84 = zext i32 %61 to i64
  %85 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %84
  %86 = load i64, ptr %85, align 8
  %87 = mul nsw i64 %86, 3
  %88 = add nsw i64 %87, %83
  %89 = add nsw i64 %79, %73
  %90 = mul nsw i64 %88, 2
  %91 = add nsw i64 %89, %90
  %92 = sext i32 %63 to i64
  %93 = add nsw i64 %91, %92
  %94 = srem i32 %63, 100
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %95
  store i64 %93, ptr %96, align 8
  %97 = icmp slt i32 %63, 10
  br i1 %97, label %98, label %99

98:                                               ; preds = %65
  br label %99

99:                                               ; preds = %65, %98
  %100 = phi i32 [ %61, %65 ], [ 59, %98 ]
  %101 = add nsw i32 %63, 1
  br label %60, !llvm.loop !8

102:                                              ; preds = %60
  %103 = icmp eq i32 %25, 0
  br i1 %103, label %104, label %107

104:                                              ; preds = %102
  %105 = call i32 @rand() #3
  %106 = srem i32 %105, 1000
  br label %108

107:                                              ; preds = %102
  br label %108

108:                                              ; preds = %27, %107, %104
  %109 = phi i32 [ %21, %27 ], [ %61, %107 ], [ %61, %104 ]
  %110 = phi i32 [ %22, %27 ], [ %62, %107 ], [ %62, %104 ]
  %111 = phi i32 [ %23, %27 ], [ 37, %107 ], [ %23, %104 ]
  %112 = phi i32 [ %24, %27 ], [ %24, %107 ], [ %106, %104 ]
  %113 = add nsw i32 %25, 1
  br label %20, !llvm.loop !9

114:                                              ; preds = %20
  br label %115

115:                                              ; preds = %118, %114
  %116 = phi i32 [ 0, %114 ], [ %123, %118 ]
  %117 = icmp slt i32 %116, 1000
  br i1 %117, label %118, label %124

118:                                              ; preds = %115
  %119 = sext i32 %116 to i64
  %120 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %119
  %121 = load i64, ptr %120, align 8
  %122 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @0, i64 noundef %121) #3
  %123 = add nsw i32 %116, 1
  br label %115, !llvm.loop !10

124:                                              ; preds = %115
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
