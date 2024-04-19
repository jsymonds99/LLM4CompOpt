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

5:                                                ; preds = %6, %0
  %indvars.iv = phi i64 [ %indvars.iv.next, %6 ], [ 0, %0 ]
  %exitcond.not = icmp eq i64 %indvars.iv, 1000
  br i1 %exitcond.not, label %13, label %6

6:                                                ; preds = %5
  %7 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %indvars.iv
  store i64 %indvars.iv, ptr %7, align 8
  %8 = shl nuw nsw i64 %indvars.iv, 1
  %9 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %indvars.iv
  store i64 %8, ptr %9, align 8
  %10 = mul nuw nsw i64 %indvars.iv, 3
  %11 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %indvars.iv
  store i64 %10, ptr %11, align 8
  %12 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %indvars.iv
  store i64 0, ptr %12, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %5, !llvm.loop !6

13:                                               ; preds = %5
  call void @srand(i32 noundef 4) #3
  br label %14

14:                                               ; preds = %81, %13
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %81 ], [ 0, %13 ]
  %.07 = phi i32 [ %.29, %81 ], [ 15, %13 ]
  %.04 = phi i32 [ %.26, %81 ], [ 5, %13 ]
  %.0 = phi i32 [ %.3, %81 ], [ 0, %13 ]
  %exitcond20.not = icmp eq i64 %indvars.iv17, 1000000000
  br i1 %exitcond20.not, label %82, label %15

15:                                               ; preds = %14
  %16 = sext i32 %.04 to i64
  %17 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %16
  %18 = load i64, ptr %17, align 8
  %19 = mul i64 %18, 87
  %20 = sdiv i64 %19, 4
  %21 = add nsw i64 %20, 23
  %22 = zext i32 %.07 to i64
  %23 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %22
  %24 = load i64, ptr %23, align 8
  %25 = mul i64 %24, 231
  %26 = sdiv i64 %25, 3
  %27 = add nsw i64 %26, 59
  %28 = add nsw i64 %27, %21
  %29 = srem i64 %28, 1000
  %30 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %29
  %31 = load i64, ptr %30, align 8
  %32 = add nsw i64 %18, %31
  %33 = add nsw i64 %32, %24
  %34 = mul nsw i64 %21, 11
  %35 = mul nsw i64 %27, 13
  %36 = mul nsw i64 %33, 17
  %37 = add i64 %34, %indvars.iv17
  %38 = add i64 %37, %35
  %39 = add i64 %38, %36
  %40 = trunc i64 %indvars.iv17 to i32
  %.urem16 = urem i32 %40, 1000
  %41 = zext i32 %.urem16 to i64
  %42 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %41
  store i64 %39, ptr %42, align 8
  %43 = icmp ult i64 %indvars.iv17, 100
  br i1 %43, label %44, label %81

44:                                               ; preds = %15, %45
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %45 ], [ 0, %15 ]
  %.1 = phi i32 [ %spec.select, %45 ], [ %.0, %15 ]
  %exitcond15.not = icmp eq i64 %indvars.iv12, 1000000
  br i1 %exitcond15.not, label %76, label %45

45:                                               ; preds = %44
  %46 = zext i32 %.1 to i64
  %47 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %46
  %48 = load i64, ptr %47, align 8
  %49 = mul nsw i64 %48, 6
  %50 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %46
  %51 = load i64, ptr %50, align 8
  %52 = sdiv i64 %51, 2
  %53 = add nsw i64 %52, %49
  %54 = srem i64 %53, 1000
  %55 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %54
  %56 = load i64, ptr %55, align 8
  %57 = shl nsw i64 %56, 1
  %58 = shl nsw i64 %48, 2
  %59 = add nsw i64 %58, %57
  %60 = srem i64 %59, 1000
  %61 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %60
  %62 = load i64, ptr %61, align 16
  %63 = mul nsw i64 %62, 6
  %64 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %46
  %65 = load i64, ptr %64, align 8
  %66 = mul nsw i64 %65, 3
  %67 = add nsw i64 %66, %63
  %68 = mul nsw i64 %67, 2
  %69 = add i64 %53, %indvars.iv12
  %70 = add i64 %69, %59
  %71 = add i64 %70, %68
  %72 = trunc i64 %indvars.iv12 to i32
  %.urem = urem i32 %72, 100
  %73 = zext i32 %.urem to i64
  %74 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %73
  store i64 %71, ptr %74, align 8
  %75 = icmp ult i64 %indvars.iv12, 10
  %spec.select = select i1 %75, i32 59, i32 %.1
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  br label %44, !llvm.loop !8

76:                                               ; preds = %44
  %77 = icmp eq i64 %indvars.iv17, 0
  br i1 %77, label %78, label %81

78:                                               ; preds = %76
  %79 = call i32 @rand() #3
  %80 = srem i32 %79, 1000
  br label %81

81:                                               ; preds = %15, %76, %78
  %.29 = phi i32 [ %.07, %15 ], [ %.07, %78 ], [ 37, %76 ]
  %.26 = phi i32 [ %.04, %15 ], [ %80, %78 ], [ %.04, %76 ]
  %.3 = phi i32 [ %.0, %15 ], [ %.1, %78 ], [ %.1, %76 ]
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  br label %14, !llvm.loop !9

82:                                               ; preds = %14, %83
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %83 ], [ 0, %14 ]
  %exitcond24.not = icmp eq i64 %indvars.iv21, 1000
  br i1 %exitcond24.not, label %87, label %83

83:                                               ; preds = %82
  %84 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %indvars.iv21
  %85 = load i64, ptr %84, align 8
  %86 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %85) #3
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  br label %82, !llvm.loop !10

87:                                               ; preds = %82
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
