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

5:                                                ; preds = %7, %0
  %.01 = phi i32 [ 0, %0 ], [ %17, %7 ]
  %6 = icmp ult i32 %.01, 1000
  br i1 %6, label %7, label %18

7:                                                ; preds = %5
  %8 = zext i32 %.01 to i64
  %9 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %8
  store i64 %8, ptr %9, align 8
  %10 = shl nuw nsw i32 %.01, 1
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %8
  store i64 %11, ptr %12, align 8
  %13 = mul nsw i32 %.01, 3
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %8
  store i64 %14, ptr %15, align 8
  %16 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %8
  store i64 0, ptr %16, align 8
  %17 = add nuw nsw i32 %.01, 1
  br label %5, !llvm.loop !6

18:                                               ; preds = %5
  call void @srand(i32 noundef 4) #3
  br label %19

19:                                               ; preds = %91, %18
  %.07 = phi i32 [ 15, %18 ], [ %.29, %91 ]
  %.04 = phi i32 [ 5, %18 ], [ %.26, %91 ]
  %.12 = phi i32 [ 0, %18 ], [ %92, %91 ]
  %.0 = phi i32 [ 0, %18 ], [ %.3, %91 ]
  %20 = icmp ult i32 %.12, 1000000000
  br i1 %20, label %21, label %93

21:                                               ; preds = %19
  %22 = sext i32 %.04 to i64
  %23 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %22
  %24 = load i64, ptr %23, align 8
  %25 = mul i64 %24, 87
  %26 = sdiv i64 %25, 4
  %27 = add nsw i64 %26, 23
  %28 = sext i32 %.07 to i64
  %29 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %28
  %30 = load i64, ptr %29, align 8
  %31 = mul i64 %30, 231
  %32 = sdiv i64 %31, 3
  %33 = add nsw i64 %32, 59
  %34 = add nsw i64 %33, %27
  %35 = srem i64 %34, 1000
  %36 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %35
  %37 = load i64, ptr %36, align 8
  %38 = add i64 %30, %24
  %39 = add i64 %38, %37
  %40 = mul nsw i64 %27, 11
  %41 = mul nsw i64 %33, 13
  %42 = mul nsw i64 %39, 17
  %43 = zext i32 %.12 to i64
  %44 = add i64 %40, %43
  %45 = add i64 %44, %41
  %46 = add i64 %45, %42
  %47 = urem i32 %.12, 1000
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %48
  store i64 %46, ptr %49, align 8
  %50 = icmp ult i32 %.12, 100
  br i1 %50, label %51, label %91

51:                                               ; preds = %21, %53
  %.010 = phi i32 [ %85, %53 ], [ 0, %21 ]
  %.1 = phi i32 [ %spec.select, %53 ], [ %.0, %21 ]
  %52 = icmp ult i32 %.010, 1000000
  br i1 %52, label %53, label %86

53:                                               ; preds = %51
  %54 = sext i32 %.1 to i64
  %55 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %54
  %56 = load i64, ptr %55, align 8
  %57 = mul nsw i64 %56, 6
  %58 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %54
  %59 = load i64, ptr %58, align 8
  %60 = sdiv i64 %59, 2
  %61 = add nsw i64 %60, %57
  %62 = srem i64 %61, 1000
  %63 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %62
  %64 = load i64, ptr %63, align 8
  %65 = shl nsw i64 %64, 1
  %66 = shl nsw i64 %56, 2
  %67 = add nsw i64 %65, %66
  %68 = srem i64 %67, 1000
  %69 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %68
  %70 = load i64, ptr %69, align 16
  %71 = mul nsw i64 %70, 6
  %72 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %54
  %73 = load i64, ptr %72, align 8
  %74 = mul nsw i64 %73, 3
  %75 = add nsw i64 %74, %71
  %76 = mul nsw i64 %75, 2
  %77 = zext i32 %.010 to i64
  %78 = add i64 %61, %77
  %79 = add i64 %78, %67
  %80 = add i64 %79, %76
  %81 = urem i32 %.010, 100
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %82
  store i64 %80, ptr %83, align 8
  %84 = icmp ult i32 %.010, 10
  %spec.select = select i1 %84, i32 59, i32 %.1
  %85 = add nuw nsw i32 %.010, 1
  br label %51, !llvm.loop !8

86:                                               ; preds = %51
  %87 = icmp eq i32 %.12, 0
  br i1 %87, label %88, label %91

88:                                               ; preds = %86
  %89 = call i32 @rand() #3
  %90 = srem i32 %89, 1000
  br label %91

91:                                               ; preds = %88, %86, %21
  %.29 = phi i32 [ %.07, %21 ], [ %.07, %88 ], [ 37, %86 ]
  %.26 = phi i32 [ %.04, %21 ], [ %90, %88 ], [ %.04, %86 ]
  %.3 = phi i32 [ %.0, %21 ], [ %.1, %86 ], [ %.1, %88 ]
  %92 = add nuw nsw i32 %.12, 1
  br label %19, !llvm.loop !9

93:                                               ; preds = %19, %95
  %.23 = phi i32 [ %100, %95 ], [ 0, %19 ]
  %94 = icmp ult i32 %.23, 1000
  br i1 %94, label %95, label %101

95:                                               ; preds = %93
  %96 = zext i32 %.23 to i64
  %97 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %96
  %98 = load i64, ptr %97, align 8
  %99 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %98) #3
  %100 = add nuw nsw i32 %.23, 1
  br label %93, !llvm.loop !10

101:                                              ; preds = %93
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
